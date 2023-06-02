import SwiftUI
import LinkPresentation

public struct LinkPresentationView: UIViewRepresentable {
  public typealias UIViewType = LPLinkView

  let url: URL
  @Binding var redraw: Bool

  public func makeUIView(context: UIViewRepresentableContext<LinkPresentationView>) -> UIViewType {
    let view = LPLinkView(url: url)
    view.isHidden = true
    if let cachedData = MetaCache.shared.metadata(for: url) {
      update(view: view, with: cachedData)
    } else {
      self.fetchMetadata(for: url) { result in
        switch result {
        case .success(let metadata):
          MetaCache.shared.store(metadata)
          self.update(view: view, with: metadata)
        case .failure:
          self.redraw = true
        }
      }
    }
    return view
  }

  public func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<LinkPresentationView>) {
  }

  private func fetchMetadata(for url: URL, completion: @escaping (Result<LPLinkMetadata, Error>) -> Void) {
    let provider = LPMetadataProvider()

    provider.startFetchingMetadata(for: url) { metadata, error in
      if let error = error {
        completion(.failure(error))
      } else if let metadata = metadata {
        completion(.success(metadata))
      } else {
        completion(.failure(LPError(.unknown)))
      }
    }
  }

  private func update(view: UIViewType, with metadata: LPLinkMetadata) {
    DispatchQueue.main.async {
      view.metadata = metadata
      view.sizeToFit()
      self.redraw = true
      view.isHidden = false
    }
  }
}

public final class MetaCache {
  public static let shared = MetaCache()
  private init(){}

  private let storage = UserDefaults.standard

  private let key = "Metadata"

  func store(_ metadata: LPLinkMetadata) {
    do {
      let data = try NSKeyedArchiver.archivedData(withRootObject: metadata, requiringSecureCoding: true)
      var metadatas: [String: Data] = storage.dictionary(forKey: key) as? [String: Data] ?? [:]
      metadatas[metadata.originalURL!.absoluteString] = data
      storage.set(metadatas, forKey: key)
    }
    catch {
      print("Failed storing metadata with error \(error as NSError)")
    }
  }

  func metadata(for url: URL) -> LPLinkMetadata? {
    guard let metadatas = storage.dictionary(forKey: key) as? [String: Data] else {
      return nil
    }

    guard let data = metadatas[url.absoluteString] else {
      return nil
    }

    do {
      return try NSKeyedUnarchiver.unarchivedObject(ofClass: LPLinkMetadata.self, from: data)
    } catch {
      print("Failed to unarchive metadata with error \(error)")
      return nil
    }
  }
}

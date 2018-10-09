import Foundation

protocol MainCoordinatorOutput: class {
    var finishFlow: DefaultFinishHandler? { get set }
}

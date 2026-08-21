public import Compass_Primitives
public import Cyclic_Primitives
import Ordinal_Primitives

extension Compass.Cardinal {

    @inlinable
    public var cyclic: Cyclic.Group.Static<4>.Element {
        let rank: UInt8 =
            switch self {
            case .north: 0
            case .east: 1
            case .south: 2
            case .west: 3
            }

        return Cyclic.Group.Static<4>.Element(__unchecked: Ordinal(rank))
    }

    @inlinable
    public init(cyclic: Cyclic.Group.Static<4>.Element) {
        switch Int(bitPattern: Ordinal(cyclic)) {
        case 0: self = .north
        case 1: self = .east
        case 2: self = .south
        default: self = .west
        }
    }
}

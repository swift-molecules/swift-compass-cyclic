// Compass.Cardinal+Cyclic.swift
// Lossless projection between Compass.Cardinal and the cyclic group Z/4Z.

public import Compass_Primitives
public import Cyclic_Primitives
import Ordinal_Primitives

extension Compass.Cardinal {
    /// This bearing as an element of the cyclic group `Cyclic.Group.Static<4>` (Z/4Z), in
    /// clockwise order from north (north = 0).
    @inlinable
    public var cyclic: Cyclic.Group.Static<4>.Element {
        let rank: UInt8 =
            switch self {
            case .north: 0
            case .east: 1
            case .south: 2
            case .west: 3
            }
        // rank is always in 0..<4 (exhaustive switch), so the element is in-bounds by construction.
        return Cyclic.Group.Static<4>.Element(__unchecked: Ordinal(rank))
    }

    /// The cardinal direction corresponding to a Z/4Z element.
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

import Compass_Cyclic_Primitives
import Testing

@Suite
struct `Compass.Cardinal Cyclic projection` {
    @Suite struct Unit {}
    @Suite struct `Edge Case` {}
    @Suite struct Integration {}
}

extension `Compass.Cardinal Cyclic projection`.Unit {
    @Test
    func `projection round-trips`() {
        for cardinal in Compass.Cardinal.allCases {
            #expect(Compass.Cardinal(cyclic: cardinal.cyclic) == cardinal)
        }
    }

    @Test
    func `clockwise is +1 in Z/4Z`() {
        for cardinal in Compass.Cardinal.allCases {
            #expect(Compass.Cardinal(cyclic: cardinal.cyclic + .one) == cardinal.clockwise)
        }
    }
}

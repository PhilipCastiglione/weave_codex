import type Domain from './Domain'
import type Fauna from './Fauna'
import type Flora from './Flora'
import type Species from './Species'

export default interface Entities {
  Domain: Domain[]
  Fauna: Fauna[]
  Flora: Flora[]
  Species: Species[]
}

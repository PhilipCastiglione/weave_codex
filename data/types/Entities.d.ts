import type Fauna from './Fauna'
import type Flora from './Flora'
import type Species from './Species'

export default interface Entities {
  Fauna: Fauna[]
  Flora: Flora[]
  Species: Species[]
}

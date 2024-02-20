import type Biome from './Biome'
import type Character from './Character'
import type City from './City'
import type Domain from './Domain'
import type Fauna from './Fauna'
import type Flora from './Flora'
import type Organization from './Organization'
import type Species from './Species'

export default interface Entities {
  Biome: Biome[]
  Character: Character[]
  City: City[]
  Domain: Domain[]
  Fauna: Fauna[]
  Flora: Flora[]
  Organization: Organization[]
  Species: Species[]
}

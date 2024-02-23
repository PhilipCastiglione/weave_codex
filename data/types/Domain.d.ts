export default interface Domain {
  species_ids: number[]
  organization_ids: number[]
  city_ids: number[]
  character_ids: number[]
  description: string
  sociocultural: string
  politics_economics_and_law: string
  philosophy_religion_and_magic: string
  id: number
  name: string
  created_at: Date
  updated_at: Date
  map_region: string
}

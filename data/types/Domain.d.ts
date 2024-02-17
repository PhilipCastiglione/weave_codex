export default interface Domain {
  id: number
  name: string
  species_ids: number[]
  description: string
  sociocultural: string
  politics_economics_and_law: string
  philosophy_religion_and_magic: string
  created_at: Date
  updated_at: Date
}

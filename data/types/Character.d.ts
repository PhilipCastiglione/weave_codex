export default interface Character {
  background: string
  physical_description: string
  personality: string
  other_notes: string
  id: number
  name: string
  species_id: number
  domain_id: number
  organization_id?: number
  created_at: Date
  updated_at: Date
}

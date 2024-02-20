export default interface Organization {
  child_ids: number[]
  character_ids: number[]
  city_ids: number[]
  description: string
  id: number
  name: string
  classification: string
  membership_numbers: number
  domain_id: number
  parent_id: number
  created_at: Date
  updated_at: Date
}

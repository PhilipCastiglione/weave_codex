export default interface Domain {
  id: number
  name: string
  domain_id: number
  parent_id: number
  children_ids: number[]
  description: string
  created_at: Date
  updated_at: Date
}

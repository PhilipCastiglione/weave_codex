export default interface Species {
  domain_ids: number[]
  character_ids: number[]
  description: string
  id: number
  name: string
  diet?: string
  created_at: Date
  updated_at: Date
}

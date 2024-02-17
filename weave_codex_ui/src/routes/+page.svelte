<script lang="ts">
  import type Entities from '../../../data/types/Entities.d.ts';
  export let data: Entities;
</script>

<h1>Welcome to SvelteKit</h1>
<p>Visit <a href="https://kit.svelte.dev">kit.svelte.dev</a> to read the documentation</p>

<h2>Domain</h2>
{#each data.Domain as domain}
  <p>{domain.id}: {domain.name} - {@html domain.description}</p>
  <p>
    Species:
    {domain.species_ids.map(species_id => data.Species.find(s => s.id === species_id)?.name).join(", ")}
  </p>
{/each}

<h2>Fauna</h2>
{#each data.Fauna as fauna}
  <p>{fauna.id}: {fauna.name} - {@html fauna.description}</p>
{/each}

<h2>Flora</h2>
{#each data.Flora as flora}
  <p>{flora.id}: {flora.name} - {@html flora.description}</p>
{/each}

<h2>Species</h2>
{#each data.Species as species}
  <p>{species.id}: {species.name} - {@html species.description}</p>
  <p>
    Domains:
    {species.domain_ids.map(domain_id => data.Domain.find(s => s.id === domain_id)?.name).join(", ")}
  </p>
{/each}

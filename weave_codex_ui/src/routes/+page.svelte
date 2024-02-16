<script lang="ts">
  import type Entities from '../../../data/types/Entities.d.ts';
  export let data: Entities;
</script>

<h1>Welcome to SvelteKit</h1>
<p>Visit <a href="https://kit.svelte.dev">kit.svelte.dev</a> to read the documentation</p>

<h2>Fauna</h2>
{#each data.Fauna as fauna}
  <p>{fauna.id}: {fauna.name} - {@html fauna.description}</p>
{/each}

<h2>Flora</h2>
{#each data.Flora as flora}
  <p>{flora.id}: {flora.name} - {@html flora.description}</p>
{/each}

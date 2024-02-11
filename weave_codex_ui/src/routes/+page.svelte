<script lang="ts">
  export let data;
</script>

<h1>Welcome to SvelteKit</h1>
<p>Visit <a href="https://kit.svelte.dev">kit.svelte.dev</a> to read the documentation</p>

{#each Object.keys(data) as entityName}
  <h2>{entityName}</h2>
  {#each data[entityName] as entity (entity.id)}
    <p>{entity.id}: {entity.name} - {@html entity.description}</p>
  {/each}
{/each}

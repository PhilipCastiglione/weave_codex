<script lang="ts">
  import type Entities from '../../../data/types/Entities.d.ts';
  export let data: Entities;

  import allosV1 from './maps/allos_v1.jpeg';
  import underworldV1 from './maps/underworld_v1.jpeg';

  let mapOptions = [
    {
      value: allosV1,
      id: 'allos',
      label: 'Allos',
    },
    {
      value: underworldV1,
      id: 'underworld',
      label: 'The Underworld',
    },
  ];

  let selectedMap = mapOptions[0].value;

  $: selectedMapDescription = mapOptions.find((option) => option.value === selectedMap)?.label;
</script>

<h1>Weave</h1>
<p>Go <a href="/about">about</a>...</p>

{#each mapOptions as { value, id, label }}
  <p>
    <input type="radio" {id} {value} bind:group={selectedMap} />
    <label for={id}> {label} </label>
  </p>
{/each}

<div class="map-container">
  <img class="map" src={selectedMap} alt="A map of {selectedMapDescription}" />
</div>

<style>
  .map-container {
    width: 100vw;
  }

  .map {
    max-width: 100%;
    height: auto;
  }
</style>

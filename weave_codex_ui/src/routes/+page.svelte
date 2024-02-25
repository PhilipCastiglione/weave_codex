<script lang="ts">
  import type Entities from '../../../data/types/Entities.d.ts';
  export let data: Entities;

  import TopBar from './top_bar/TopBar.svelte';

  import allosV1 from './maps/allos_v1.jpeg';
  import underworldV1 from './maps/underworld_v1.jpeg';

  interface MapOption {
    value: string;
    id: string;
    label: string;
  }

  let mapOptions: MapOption[] = [
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

<TopBar title="Weave">
  <a href="/about" slot="link">About</a>
</TopBar>

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

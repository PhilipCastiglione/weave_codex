<script lang="ts">
  export let title: string;
</script>

<header>
  <p>Logo</p>
  <h1>{title}</h1>
  <p><slot name="link" /></p>
</header>

<style>
  header {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  h1 {
    text-align: center;
    flex-grow: 1;
  }
</style>

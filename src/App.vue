<script setup lang="ts">
import { onMounted, ref } from "vue"
import axios from 'axios'
import Main from './components/Main.vue'
const informationAboutAvatar = ref([])

async function getData() {
  const { data } = await axios.get('https://rickandmortyapi.com/api/character')
  informationAboutAvatar.value = data.results
}

onMounted(async()=> {
  await getData()
})
</script>

<template>
  <main>
    <Main :informationAboutAvatar="informationAboutAvatar" />
  </main>
</template>

<style scoped>

header {
  line-height: 1.5;
}

.logo {
  display: block;
  margin: 0 auto 2rem;
}

@media (min-width: 1024px) {

  .logo {
    margin: 0 2rem 0 0;
  }

  main {
    width: 100%;
  }
}
</style>

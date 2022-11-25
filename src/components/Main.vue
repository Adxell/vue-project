<script setup lang="ts">
import Card from './Card.vue'
import type { Result } from '../interfaces/avatar.interface'

defineProps<{
  informationAboutAvatar: Result[],
}>()
</script>

<template>
  <div class="container_mean">
  <template v-for="avatar in informationAboutAvatar">
      <Card>
        <template #image><img class="image_post" :src="avatar.image" :alt="avatar.name"></template>
        <template #heading>{{ avatar.name}}</template>
        <template #origin>Origin: {{avatar.origin.name}}</template>
        <span><strong>Status:</strong> {{avatar.status}}</span>
        <span><strong>Gender:</strong> {{avatar.gender}}</span>
        <span><strong>Location:</strong> {{avatar.location.name}}</span>
      </Card>
    </template>
  </div>
</template>

<style scoped>
.container_mean{
  display: grid;
  grid-template-columns: 1fr;
}
span {
  display: block;
  font-size: 18px;
  color: #fff;
  padding: 0px 10px;
}

strong{
  font-weight: 600;
}
.image_post {
  flex-shrink: 0;
  min-width: 100%;
  min-height: 100%;
  object-fit: cover;
  transition: all 0.5s ease-in-out;
}
.image_post:hover {
  transform: scale(1.2);
}


@media (min-width: 768px) {
  .container_mean{
    grid-template-columns: 1fr 1fr;
  }
}

@media (min-width: 1024px) {
  .container_mean{
    grid-template-columns: 1fr 1fr 1fr;
  }
}
</style>

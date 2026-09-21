<script setup lang="ts">
const nodes = ['Code', 'Demande', 'Architecture', 'Rules', 'Tests', 'Sécurité']
</script>

<template>
  <div class="concept-map">
    <div class="concept-map__agent">AGENT<br /><span>répondre juste</span></div>
    <div v-for="(node, index) in nodes" :key="node" class="concept-map__node" :class="`concept-map__node--${index}`" v-click="index + 1">
      {{ node }}
    </div>
  </div>
</template>

<style scoped>
.concept-map { height: 300px; margin: 26px auto 0; max-width: 800px; position: relative; }
.concept-map::before, .concept-map::after { background: var(--line); content: ""; height: 2px; left: 50%; position: absolute; top: 50%; transform-origin: left; width: 200px; }
.concept-map::before { transform: rotate(-28deg); }
.concept-map::after { transform: rotate(28deg); }
.concept-map__agent { background: var(--ink); border-radius: 50%; color: #fff; font-size: 21px; font-weight: 700; height: 150px; left: calc(50% - 75px); padding-top: 48px; position: absolute; text-align: center; top: calc(50% - 75px); width: 150px; z-index: 2; }
.concept-map__agent span { color: #bdc5ff; font-size: 16px; font-weight: 400; }
.concept-map__node { background: #fff; border: 1px solid var(--line); border-radius: 999px; font-size: 20px; padding: 12px 22px; position: absolute; }
.concept-map__node--0 { left: 16px; top: 15px; }
.concept-map__node--1 { right: 16px; top: 15px; }
.concept-map__node--2 { bottom: 55px; left: 0; }
.concept-map__node--3 { bottom: 55px; right: 0; }
.concept-map__node--4 { bottom: 35px; left: 250px; }
.concept-map__node--5 { bottom: 35px; right: 240px; }
</style>

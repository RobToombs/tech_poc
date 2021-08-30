<template>
  <div class="info">
    <Patient/>
  </div>
</template>

<script>
// @ is an alias to /src
import Patient from "@/components/Patient.vue";

export default {
  name: "patient",
  components: {
    Patient,
  },
};
</script>

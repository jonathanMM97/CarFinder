<template>
    <div class="load">
        <img class="rim-image" src="../assets/rim.png">
    </div>
</template>

<script>

</script>

<style lang="scss" scoped>

.load {
    position: absolute;
    width: 300px;
    height: 300px;
    top: 50rem;
    left: 50rem;
}

.rim-image {
    position: absolute;
    width: 100%;
    height: 100%;
    animation: rotate 10s linear infinite;
}

@keyframes rotate {
    0% {
        transform: rotate(0deg);
    }

    100% {
        transform: rotate(360deg);
    }
}
</style>
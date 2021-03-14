<template>
  <div class="wrapper">
      <h3 v-if="cartItems.length === 0">Cart is empty.  Go to <router-link to="/">Home</router-link>
       or <router-link to="/browse">Browse</router-link> to add items.</h3>
    <div class="cart">
      <div class="item" v-for="(item, i) in cartItems" :key="i">
        <div class="info">
          <h1>{{ item.name }}</h1>
          <p>{{ item.country }}</p>
        </div>
        <div class="image">
          <img :src="'/images/products/' + item.image">
        </div>
        <div class="price">
          <h2>{{ item.price }}</h2>
          <button class="auto" @click="remove(item)">Remove</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'Cart',
    computed: {
      cartItems() {
          return this.$root.$data.cart;
      }
    },
    methods: {
      remove(product) {
        this.$root.$data.cart.splice(this.$root.$data.cart.indexOf(product), 1);
      }
    }
  };
</script>

<style scoped>
  .wrapper {
    display: flex;
    align-items: center;
    justify-content: center;
  }

  .cart {
    margin-top: 20px;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
  }

  .item {
    margin: 10px;
    margin-top: 50px;
    width: 200px;
  }

  .item img {
    border: 2px solid #333;
    height: 250px;
    width: 200px;
    object-fit: cover;
  }

  .item .image {
    display: flex;
    justify-content: center;
    margin-bottom: 5px;
  }

  .info {
    background: #B84901;
    color: #fff;
    padding: 10px 30px;
    height: 80px;
  }

  .info h1 {
    font-size: 16px;
  }

  .info h2 {
    font-size: 14px;
  }

  .info p {
    margin: 0px;
    font-size: 10px;
  }


  .price {
    display: flex;
  }

  button {
    height: 50px;
    background: #000;
    color: white;
    border: none;
  }

  .auto {
    margin-left: auto;
  }
</style>
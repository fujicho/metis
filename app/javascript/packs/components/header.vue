<template>
  <div id="app">
    <header>
      <v-navigation-drawer app>Navigation</v-navigation-drawer>
      <v-app-bar-nav-icon></v-app-bar-nav-icon>
      <h1>
        <a href="/">Metista</a>
      </h1>
      <nav>
        <ul>
          <v-btn href="/account" text color="primary" dark large>アカウント</v-btn>
          <v-btn href="/session" text data-method="delete" color="primary" dark large>ログアウト</v-btn>
        </ul>
      </nav>
    </header>
  </div>
</template>

<script>
</script>

<style>
header {
    width: 100%;
    padding: 10px 4% 10px;
    background-color: #2196F3;
    position: fixed;
    top: 0;
    display: flex;
    align-items: center;
  }
h1
  {
    margin: 0; padding: 0;
    font-size: 20px;
  }
a {
  text-decoration: none;
  color: #ffffff;
  }
ul {
  list-style: none;
  margin: 0;
  display: flex;
}
li {
  margin: 0 0 0 15px;
  font-size: 14px;
}
nav {
  margin: 0 0 0 auto;
  }
</style>
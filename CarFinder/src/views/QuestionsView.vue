<template>
<h1>Preguntas</h1>

<div class="container" v-for="(item, i) in list" :key="i">
  <section>
    <h2>{{ i+1 }}. {{ item.text }}</h2>

    <div v-for="(answer, j) in item.answers" :key="j">
      <label :for="'question_' + i + '_answer_' + j">
        <input type="radio" :id="'question_' + i + '_answer_' + j" :value="answer.id" :name="'question_' + i" v-model="checked[i]">
        
        <span>{{ answer.text }}</span>
      </label>
    </div>
  </section>
</div>
<button v-on:click="sendAnswer()">Enviar</button>
</template>

<script>
import axios from 'axios'

export default {

  data() {
    return {
      checked: [],
      list:[]
    }
  },
  methods:{
    async sendAnswer() {
        await axios.post("http://localhost:8080/quiz/answer/bulk",this.checked)
                  .then(response => console.log(response))
                  .catch(error => console.log(error))
    }
  }
  ,
  async mounted(){
    let result = await axios.get("http://localhost:8080/quiz/round");
    console.warn(result.data);
    this.list = result.data;
  }
};
</script>

<style lang="scss" scoped>

h1 {
  display: flex;
  justify-content: center;
  margin-top: 10rem;
}

.container {
  max-width: 700;
  margin: auto;
  padding: 20px;
}

section{
  border: 2px solid rgba(0, 0, 0, 0.8);
  border-radius: 7px;
  padding: 10px;
  margin: 10px 0;
}

h2 {
  text-align: center;
}

input[type="radio"] {
  display: none;
}

label {
  display: block;
  cursor: pointer;
  font-weight: 500;
  margin-bottom: 10px;
}

label span{
  display: inline-flex;
  align-items: center;
  padding: 10px 20px 10px 10px;
  border-radius: 31px;
  transition: 0.25s;
}

label span:hover,
input[type="radio"]:checked + span{
  background: rgba(0, 0, 0, 0.8);
  color: #fff;
}

label span:before {
  content: "";
  background: #fff;
  width: 16px;
  height: 16px;
  border-radius: 50%;
  margin-right: 10px;
  transition: 0.25s ease all;
  box-shadow: inset 0 0 0 2px rgba(0, 0, 0, 0.8);
}

input[type="radio"]:checked + span:before {
  box-shadow: inset 0 0 0 10px #00005c;
}

button {
  margin-left: 50%;
  margin-top: 2rem;
  margin-bottom: 2rem;
  height: 50%;
  border: 1px solid rgba(0, 0, 0, 0.8);
  border-radius: 25px;
  font-size: 18px;
  color: rgba(0, 0, 0, 0.8);
  font-weight: 700;
  cursor: pointer;
  outline: none;
}

button:hover {
  background: rgba(0, 0, 0, 0.8);
  color:#fff;
}

</style>
<template>
  <button v-show="list.length === 0" @click="addAll" class="btn-add">
    Add questions
  </button>
  <div class="manage-questions" v-show="manageQuestions" v-if="list.length > 0">
    <div class="btn">
      <input class="btn search-q" type="text">
      <button @click="deleteall" class="btn btn-delete">
        <img class="trash-item" src="../assets/trash.png">
        Delete all
      </button>
    </div>
    <div>
      <a @click="showInfoQuest(question.id)" class="questions" v-for="question in list" :key="question.id">
        <div class="text-quest">
          {{ question.id }} {{ question.text }}
          <i @click.stop="hideInfoQuest(question.id)" v-show="isInfoQuest(question.id)" class="fa-solid fa-xmark fa-lg"></i>
        </div>
        <div v-show="isInfoQuest(question.id)" class="total-info">
          <div class="quest-answer">
            Respuestas:
            <ul v-for="ask in question.answers">
              <li class="items">
                {{ ask.text }}
                <button @click="deleteAnswer(ask.id)" class="btn btn-delete2">
                  <img class="trash-item" src="../assets/trash.png">
                  Delete
                </button>
              </li>
            </ul>
          </div>
          <button class="btn btn-delete2">
            <img class="trash-item" src="../assets/trash.png">
            Delete
          </button>
        </div>
      </a>
    </div>
  </div>
  <div v-show="!manageQuestions">
    <img class="not-permission" src="../assets/notPermission.png">
    <h1>Esta pagina solo es visible para usuarios autenticados</h1>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data() {
    return {
      infoQuest: {},
      manageQuestions: false,
      list: [],
    }
  },
  async mounted() {
    this.getQuestions();
  },
  methods: {
    showInfoQuest(index) {
      this.infoQuest[index] = true;
    },
    hideInfoQuest(index) {
      this.infoQuest[index] = false;
    },
    isInfoQuest(index) {
      return this.infoQuest[index];
    },
    async deleteall() {
      let response = await axios.delete('http://localhost:8080/question/bulk', {withCredentials: true});
      this.list = [];
    },
    async deleteAnswer(index) {
      let response = await axios.delete('http://localhost:8080/answer', {withCredentials: true}, index);
    },
    async addAll() {
      let response = await axios.post("http://localhost:8080/question/bulkDefault", {withCredentials: true});
      this.getQuestions();
    },
    async getQuestions() {
      try {
        let response = await axios.get('http://localhost:8080/question', { withCredentials: true });
        await this.$nextTick();
        this.list = [...response.data];
        this.manageQuestions = true;
      } catch (error) {
        console.error(error);
      }
    }
  },
};
</script>

<style lang="scss" scoped>

.btn-add {
  position: absolute;
  top: 5.7rem;
  left: 0;
  margin-top: 10rem;
  text-align: center;
  padding: 10px 20px;
  margin-left: 2rem;
  font-size: 16px;
  border-radius: 20px;
  text-transform: uppercase;
  cursor: pointer;
  background: #12fc2d;
  color: rgba(0, 0, 0, 0.8);
}

h1 {
  position: absolute;
  top: 50%;
  left: 50%;
}

.manage-questions {
  position: absolute;
  width: 100%;
  height: 100%;
  top: 5.7rem;
  left: 0;
  margin-top: 10rem;
  text-align: center;

  .btn {
    flex-direction: row;

    input {
      padding: 10px 100px;
      font-size: 16px;
      border-radius: 20px;
    }

    button {
      padding: 10px 20px;
      margin-left: 2rem;
      font-size: 16px;
      border-radius: 20px;
      text-transform: uppercase;
      cursor: pointer;
      background: #ee4848;
      color: #fff;

      .trash-item{
        width: 15px;
        height: 15px;
      }
    }
  }

  .questions{
    position: relative;
    display: block;
    width: 50%;
    left: 23%;
    padding: 10px 20px;
    border-radius: 20px;
    margin-top: 10px;
    background: #fff;
    border: 1px solid #fff;
    transition: 0.8s ease all;

    .text-quest {
      display: flex;
      cursor: pointer;
      align-items: center;
      justify-content: center;
    }

    .text-quest i {
      cursor: pointer;
      margin-left: auto;
      transition: 0.8s ease all;
    }

    .total-info{
      margin-top: 1rem;
      display: flex;
      flex-direction: column;
      border-top: 1px solid #00afea;
      padding-top: 10px;
      text-align: left;

      .items{
        display: flex;
        justify-content: space-between;
        align-items: center;
        list-style: none;
      }

      button {
        padding: 5px 10px;
        font-size: 16px;
        border-radius: 20px;
        text-transform: uppercase;
        cursor: pointer;
        background: silver;
        color: rgba(0, 0, 0, 0.8);
        transition: 0.8s ease all;

        .trash-item{
          width: 15px;
          height: 15px;
        }
      }

      button:hover{
        background: #ee4848;
        color: #fff;
      }
    }
  }

  .questions:hover{
    cursor:auto;
    background: rgba(0, 0, 0, 0.8);
    color: #fff;
  }

  i:hover{
    color: #ee4848;
  }
}

.not-permission {
  margin-top: 20rem;
  margin-left: 20rem;
  width: 200px;
  height: 200px;
}
</style>
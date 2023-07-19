<template>

    <v-slot :manageQuestions="manageQuestions" :isLoading="isLoading"></v-slot>


    <div class="restore">
      <button @click="addAll" class="btn btn-add">
        Restore questions
      </button>
      <button @click="deleteall" class="btn btn-delete">
        <img class="trash-item" src="../assets/trash.png">
        Delete all
      </button>
    </div>

    <div class="manage-questions" v-show="manageQuestions" v-if="list.length > 0">
      <div class="btn">
        <input class="btn search-q" type="text">
        <a @click="showInfoQuest(question.id)" class="questions" v-for="(question, i) in sortedList" :key="question.id">
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
                  <button @click="deleteAnswer(ask.id, question.id, i)" class="btn btn-delete2">
                    <img class="trash-item" src="../assets/trash.png">
                    Delete
                  </button>
                </li>
              </ul>
            </div>
            <button @click="deleteQuestion(question.id)" class="btn btn-delete2">
              <img class="trash-item" src="../assets/trash.png">
              Delete
            </button>
          </div>
        </a>
      </div>
    </div>

    <Loading v-show="isLoading"></Loading>
</template>




<script>
import axios from 'axios';
import Loading from '../components/Loading.vue'

export default {
  components: { Loading},
  data() {
    return {
      isLoading: false,
      infoQuest: {},
      list: [],
      manageQuestions: false,
    }
  },
  computed: {
    sortedList() {
      const uniqueList = Array.from(new Set(this.list.map(item => item.id)));
      const sortedUniqueList = uniqueList.sort((a, b) => a - b);
      return sortedUniqueList.map(id => this.list.find(item => item.id === id));
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
    async deleteAnswer(indexAnsw, indexQuest, index) {
      this.isLoading = true;

      let path_ = 'http://localhost:8080/answer/' + indexAnsw;
      let path_2 = 'http://localhost:8080/question/' + indexQuest;
      await axios.delete(path_, {withCredentials: true});
      await new Promise(resolve => setTimeout(resolve, 2000));
      let response2 = await axios.get(path_2, {withCredentials: true});
      this.list[index] = '';
      this.list.splice(index, 1, response2.data);

      this.isLoading = false;
    },
    async deleteQuestion(index) {

      this.isLoading = true;

      let path_ = 'http://localhost:8080/question/' + index;
      await axios.delete(path_, {withCredentials: true});
      await new Promise(resolve => setTimeout(resolve, 2000));
      await this.getQuestions();

      this.isLoading = false;
    },
    async addAll() {
      this.isLoading = true;

      let response = await axios.post("http://localhost:8080/question/bulkDefault", {withCredentials: true});
      await new Promise(resolve => setTimeout(resolve, 2000));
      await this.getQuestions();
      
      this.isLoading = false;
    },
    async getQuestions() {
      try {
        let response = await axios.get('http://localhost:8080/question', { withCredentials: true });
        console.log(response.data);
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

.restore {
  margin-top: 20vh;
  margin-left: 60vh;
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
  .btn-add {
      background: #74f339;
      color: rgba(0, 0, 0, 0.8);
    }
}
.load {
    position: fixed;
    width: 150px;
    height: 150px;
    top: 40%;
    left: 40%;
}

.rim-image {
    position: absolute;
    width: 100%;
    height: 100%;
    animation: rotate 3s linear infinite;
}

@keyframes rotate {
    0% {
        transform: rotate(0deg);
    }

    100% {
        transform: rotate(360deg);
    }
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
</style>
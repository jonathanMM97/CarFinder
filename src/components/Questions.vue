<template>

    <v-slot :manageQuestions="manageQuestions" :isLoading="isLoading"></v-slot>

    <div v-show="!manageQuestions">
        <img class="not-permission" src="../assets/notPermission.png">
        <h1>Esta página solo es visible para usuarios autenticados</h1>
    </div>

    <div class="restore" v-show="manageQuestions">
        <button @click="addAll" class="btn btn-add">
            <img class="restore-icon" src="../assets/refresh-icon.png">
            Reestablecer
        </button>
        <button @click="deleteall" class="btn btn-delete">
            <div class="delete-buttons">
                <img class="trash-item-static" src="../assets/icons8-trash_static.png">
                <img class="trash-item-active" src="../assets/icons8-trash.gif">
            </div>
            Eliminar todas
        </button>
    </div>

    <div class="manage-questions" v-show="manageQuestions" v-if="list.length > 0">
        <div class="btn">
            <input class="btn search-q" type="text" placeholder="Busca por id o por texto..." v-model="text">
            <a v-show="match(question)" @click="showInfoQuest(question.id)" class="questions"
               v-for="(question, i) in sortedList" :key="question.id">
                <div class="text-quest">
                    {{ question.id }} {{ question.text }}
                    <i @click.stop="hideInfoQuest(question.id)" v-show="isInfoQuest(question.id)"
                       class="fa-solid fa-xmark fa-lg"></i>
                </div>
                <div v-show="isInfoQuest(question.id)" class="total-info">
                    <div class="quest-answer">
                        Respuestas:
                        <ul v-for="ask in question.answers">
                            <li class="items">
                                {{ ask.text }}
                                <button @click="deleteAnswer(ask.id, question.id, i)" class="btn btn-delete2">
                                    <img class="trash-item" src="../assets/trash.png">
                                    Eliminar
                                </button>
                            </li>
                        </ul>
                    </div>
                    <button @click="deleteQuestion(question.id)" class="btn btn-delete2">
                        <img class="trash-item" src="../assets/trash.png">
                        Eliminar todas
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
      text: '',
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
    },
  },
  async mounted() {
    this.getQuestions();
  },
  methods: {
    match(question) {
      if(this.text !== '' )
      {
        switch(true) {
          case question.id === this.text : return true;
          case question.text.includes(this.text): return true;
        }
        for( const answer of question.answers) 
        {
          if(answer.id === this.text)
            return true;
          if(answer.text.includes(this.text))
            return true;
        }
        return false;
      }else{
        return true;
      }
    },
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
  display: flex;
  margin-top: 10rem;
  justify-content: center;
  gap: 10px;

  button.btn.btn-delete {
    background: #ee4848;
    box-shadow: rgba(45, 35, 66, 0.4) 0 2px 4px, rgba(45, 35, 66, 0.3) 0 7px 13px -3px, #e28f97 0 -3px 0 inset;

    .trash-item-static {
      position:absolute;
      background: #ee4848;
    }

    &:hover .trash-item-static {
        opacity: 0;
    }
  }

  button.btn {
    align-items: center;
    appearance: none;
    background-color: #96b0f4;
    border-radius: 4px;
    border-width: 0;
    box-shadow: rgba(45, 35, 66, 0.4) 0 2px 4px, rgba(45, 35, 66, 0.3) 0 7px 13px -3px, #b6c3ed 0 -3px 0 inset;
    box-sizing: border-box;
    color: #36395A;
    text-transform: uppercase;
    font-family: 'Lato', sans-serif;
    cursor: pointer;
    display: inline-flex;
    height: 48px;
    justify-content: center;
    line-height: 1;
    list-style: none;
    overflow: hidden;
    padding-left: 16px;
    padding-right: 16px;
    position: relative;
    text-align: left;
    text-decoration: none;
    transition: box-shadow 0.15s, transform 0.15s;
    user-select: none;
    -webkit-user-select: none;
    touch-action: manipulation;
    white-space: nowrap;
    will-change: box-shadow, transform;
    font-size: 18px;

    img{
      width: 24px;
      height: 24px;
      margin-right: 2px;
    }

    &:focus {
      box-shadow: #D6D6E7 0 0 0 1.5px inset, rgba(45, 35, 66, 0.4) 0 2px 4px, rgba(45, 35, 66, 0.3) 0 7px 13px -3px, #D6D6E7 0 -3px 0 inset;
    }

    &:hover {
      box-shadow: rgba(45, 35, 66, 0.4) 0 4px 8px, rgba(45, 35, 66, 0.3) 0 7px 13px -3px, #D6D6E7 0 -3px 0 inset;
      transform: translateY(-2px);
    }

    &:active {
      box-shadow: #D6D6E7 0 3px 7px inset;
      transform: translateY(2px);
    }

    &:hover .restore-icon {
      transform: rotate(360deg);
      transition: transform 0.5s ease;
    }
  }
}
/*.restore {
  margin-top: 10rem;
  margin-left: 30rem;
  button {
      padding: 10px 20px;
      margin-left: 2rem;
      font-size: 16px;
      border-radius: 10px;
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
      background: #96b0f4;
      color: rgba(0, 0, 0, 0.8);
    }

  .restore-icon {
    width: 15px;
    height: 15px;
  }

  .btn-add:hover .restore-icon {
    transform: rotate(360deg);
    transition: transform 0.5s ease;
}
}*/

h1 {
  position: absolute;
  top: 50%;
  left: 50%;
}

.manage-questions {
  margin-top: 2rem;
  margin-bottom: 2rem;
  width: 100%;
  height: 100%;
  left: 0;
  text-align: center;

  .btn {
    flex-direction: row;

    input {
      padding: 10px 20px; /* Padding vertical de 15px y sin padding horizontal */
      font-size: 16px; /* Ajusta el tamaño de fuente según tus preferencias */
      border-radius: 20px;
      width: 400px;
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

  .not-permission {
      margin-top: 20rem;
      margin-left: 20rem;
      width: 200px;
      height: 200px;
  }

</style>
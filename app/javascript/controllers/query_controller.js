import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "question", "source", "answer" ]

  connect () {
    console.log("Query controller connected")
  }
  
  submit() {
    const question = this.questionTarget.value
    const source = this.sourceTarget.value

    console.log(`Submitting question: ${question} from source: ${source}`)

    fetch(`/query?question=${question}&source=${source}`)
      .then(response => {
        console.log(response)
        return response.json()
      })
      .then(json => {
        console.log(json.answer)
        this.answerTarget.innerHTML = json.answer
      })
  }
}

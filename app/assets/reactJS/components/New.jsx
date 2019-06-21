import React from "react"
import Form from "./_form.js"

class New extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      product: []
    };
    this.handleFormSubmit = this.handleFormSubmit.bind(this)
    this.addNewProduct = this.addNewProduct.bind(this)
  }

  handleFormSubmit(name, description) {
    let body = JSON.stringify({product: {name: name, description: description}})
    fetch('http://localhost:3000/api/v1/fruits', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: body,
    }).then((response) => {
      return response.json()
    })
        .then((product) => {
          this.addNewProduct(product)
        })

  }
  addNewProduct(product){
    this.setState({
      product: this.state.product.concat(product)
    })
  }

  render(){
    return(
        <React.Fragment>
          <Form handleFormSubmit={this.handleFormSubmit}/>
        </React.Fragment>
    )
  }
}

export default New
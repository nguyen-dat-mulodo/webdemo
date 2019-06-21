import React from "react"
import { Redirect } from 'react-router-dom'
import Form from "./_form.js";

class Show extends React.Component {
  constructor(props, context) {
    super(props, context);
    this.state = {
      products: [],
      editable: false
    };
    this.handleDelete = this.handleDelete.bind(this);
    this.handleFormSubmit = this.handleFormSubmit.bind(this);
    this.handleEdit = this.handleEdit.bind(this);
    this.EditProduct = this.EditProduct.bind(this)
  }

  componentDidMount(){
    let id = this.props.id;
    fetch(Routes.api_product_path(id))
      .then((response) => {return response.json()})
      .then((data) => {this.setState({ products: data }) });
  }

  componentWillUnmount() {
    alert('Goodbye world');
  }

  handleDelete(id){
    let r = confirm("Press a button!\nEither OK or Cancel.\nThe button you pressed will be displayed in the result window.");
    if (r === true) {
      fetch(Routes.api_product_path(id),
        {
          method: 'DELETE',
          headers: {
            'Content-Type': 'application/json'
          }
        }
      ).then((response) => {
        return <Redirect to='/' />
      })
    }
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
      this.EditProduct(product)
    })

  }

  handleEdit(){
    this.setState({
      editable: !this.state.editable
    })
  }

  EditProduct(product){
    this.setState({
      product: this.state.product.concat(product)
    })
  }

  render () {
    return (
      <React.Fragment>
        <nav aria-label="breadcrumb">
          <ol className={'breadcrumb'}>
            <li className={'breadcrumb-item'}>
              <a href={'#'} target={'_blank'}>
                Home
              </a>
            </li>
            <li className={'breadcrumb-item'}>
              <a href={'#'} target={'_blank'}>
                Product detail
              </a>
            </li>
            <li className={'breadcrumb-item active'} aria-current="page">
              {this.state.products.id}
            </li>
          </ol>
        </nav>
        {/*p#notice*/}
          {/*= notice*/}
        <div className={'product'}>
          <div className={'new-product'}>
            <Product products={this.state.products} editable={this.state.editable} handleDelete={this.handleDelete} handleEdit={this.handleEdit}/>
          </div>
        </div>
      </React.Fragment>
    );
  }
}
class Product extends React.Component {
  render () {
    var product = this.props.products;
    return(
      <React.Fragment>
        <div key={product.id}  className={'product'}>
          <div className={'product-image col-md-5'}>
            <a href={product.image_url} target={'_blank'}>
              <img src={product.image_url} alt={'Image'} />
            </a>
          </div>
          <div className={'product-detail'}>
            <div className={'item-action'}>
              <a href={''} className={'btn btn-default'} onClick={() => this.props.handleDelete(product)} >
                {this.props.editable? '' : 'Delete'}
              </a>
              |
              {/*<a href={Routes.edit_product_path(product)} className={'btn btn-default'}>*/}
              <a href={'javacripts:;'} className={'btn btn-default'} onClick={() => this.props.handleEdit()}>
                {this.props.editable? 'Submit' : 'Edit'}
              </a>
            </div>
            {this.props.editable ? <Form handleFormSubmit={this.handleFormSubmit}/> : <ShowProduct product={product}/>}
          </div>
        </div>
      </React.Fragment>
    );
  }
}


// let name = this.state.editable ? <input type='text' ref={input => this.name = input} defaultValue={this.props.fruit.name}/>:<h3>{this.props.fruit.name}</h3>
// let description = this.state.editable ? <input type='text' ref={input => this.description = input} defaultValue={this.props.fruit.description}/>:<p>{this.props.fruit.description}</p>

const ShowProduct = (props) => {
  return(
    <React.Fragment>
      <div className={'item-title'}>
          {props.product.title}
      </div>
      <div className={'item-description'}>
          {props.product.description}
      </div>
      <div className={'item-price'}>
          Price:
      <span className={'old-price'}>
        {props.product.price}
      </span>
      <span className={'current-price'}>
          {props.product.price}
      </span>
      {/*= button_to line_items_path(:product_id => @product), class: 'btn btn-default add-cart', remote: true, :format => :js do*/}
      {/*span.icon-shopping-cart*/}
      {/*| Add to cart*/}
      </div>
      <span className={'item-type'}>tesst type</span>
      <div className={'item-action-back'}><a className={'btn btn-default back'} href={''}/>
        <span className={'icon-arrow_back'} >
                      Back to previous page
                    </span>
      </div>
    </React.Fragment>
  )
};
export default Show

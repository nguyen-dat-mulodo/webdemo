import React from "react"
import Show from "./Show";

class Index extends React.Component {
  constructor(props, context){
    super(props, context);
    this.state = {
      products: []
    }
  }

  componentDidMount(){
    fetch(Routes.root_path({format: 'json'}))
        .then((response) => {return response.json()})
        .then((data) => {this.setState({ products: data }) });
  }

  render () {
    return (
      <React.Fragment>
        <div className={'new-product'}>
          <Product products={this.state.products} />
        </div>
      </React.Fragment>
    );
  }
}

class Product extends React.Component {
  render () {
    var products = this.props.products.map((product) => {
      return(
        <React.Fragment>
          <div key={product.id}  className={'product-item'}>
            <div className={'item-image'}>
              <a href={product.image_url} target={'_blank'}>
                <img src={product.image_url} alt={'Image'} />
              </a>
            </div>
            <p className={'item-title'}>{product.title}</p>
            <p className={'item-description'}>{product.description}</p>
            <span className={'old-price'}>{product.price}</span>
            <span className={'item-price'}>{product.price}</span>
            <span className={'item-type'}>tesst type</span>
            <div className={'item-link'}><a href={Routes.product_path(product.id)}/></div>
          </div>
        </React.Fragment>
      );
    });
    return(
      <React.Fragment>
        {products}
      </React.Fragment>
    );
  }
}

export default Index

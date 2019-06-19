import React from "react"

class Show extends React.Component {
  constructor(props, context) {
    super(props, context);
    this.state = {
      products: [],
    }
  }

  componentDidMount(){
    fetch('/products/499.json')
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
    var product = this.props.products;
    return(
      <React.Fragment>
        <div key={product.id}  className={'product'}>
          <div className={'product-image col-md-5'}>
            <a href={product.image_url} target={'_blank'}>
              <img src={product.image_url} alt={'Image'} />
              {/*= link_to(image_tag(@product.image.url(:large), alt: 'Image'), @product.image.url, target: '_blank') if @product.image.present?*/}
            </a>
          </div>
          <div className={'product-detail'}>
            <div className={'item-title'}>
              {product.title}
            </div>
            <div className={'item-description'}>
              {product.description}
            </div>
            <div className={'item-price'}>
              Price:
              <span className={'old-price'}>
                {product.price}
              </span>
              <span className={'current-price'}>
                {product.price}
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
          </div>
        </div>
      </React.Fragment>
    );
  }
}
export default Show

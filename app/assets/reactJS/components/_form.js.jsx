import React from "react";

class Form extends React.Component {
  render(){
    let formFields = {}
    return(
        <form onSubmit={ (e) => { this.props.handleFormSubmit(formFields.name.value, formFields.description.value); e.target.reset();}
        }>
          <input ref={input => formFields.name = input} placeholder='Enter the name of the item'/>
          <input ref={input => formFields.description = input} placeholder='Enter a description' />
          <button>Submit</button>
        </form>
    )
  }
}

// const NewProduct = (props) => {
//   let formFields = {}
//
//   return(
//       <form onSubmit={ (e) => { props.handleFormSubmit(formFields.name.value, formFields.description.value); e.target.reset();}
//       }>
//         <input ref={input => formFields.name = input} placeholder='Enter the name of the item'/>
//         <input ref={input => formFields.description = input} placeholder='Enter a description' />
//         <button>Submit</button>
//       </form>
//   )
// };

export default Form
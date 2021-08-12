import React, { useState } from 'react';

const SearchBar = ({onFormSubmit}) => {
  const [term, setTerm] = useState("");
  
  const onInputChange = (event) => {
    setTerm(event.target.value)
  }

  const onSubmit = event => {
      event.preventDefault();
      onFormSubmit(term)
  }
  return (
    <div className="search-bar ui segment">
        <form action="" onSubmit={onSubmit} className="ui form">
            <div className="field">
                <label htmlFor="">Search for a video and press Enter</label>
                <input 
                type="text" 
                value={term}
                onChange={(e) => setTerm(e.target.value)}
                 />
            </div>
        </form>
    </div>
  );
}
 
export default SearchBar;
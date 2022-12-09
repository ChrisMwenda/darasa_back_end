import React from "react";
import "./search.css";
function Search({ search, setSearch }) {
  return (
    <div className="search">
      <br />
      <input
        className="in"
        type="text"
        placeholder="search your car name"
        onChange={(e) => {
          setSearch(e.target.value);
        }}
      />
      <br />
    </div>
  );
}

export default Search;

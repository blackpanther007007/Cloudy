import React from "react";
import "./gallery.css";
function Gallery(props) {
    const data=props.data;
    console.log(data);
    console.log(data[0]);
    
  return (
    <>
      <div className="main_border">
        <ul className="img-list">
          {data.map((item) => {
            return (
              <>
                <li>
                  <img
                    alt="na"
                    src={item}
                  />
                </li>
              </>
            );
          })}
        </ul>
      </div>
    </>
  );
}

export default Gallery;

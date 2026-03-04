import { useEffect, useState } from "react";

function App() {
  const [str, setStr] = useState(null)

  useEffect(() => {
      fetch("http://localhost:8000/test")
          .then((res) => res.json())
          .then((data) => setStr(data));
  }, []);

  return (
    <>
      <div>
        {str && str.map((value) => 
          <p>{value.role_id}: {value.role_name}</p>)}
      </div>
    </>
  );
}

export default App;
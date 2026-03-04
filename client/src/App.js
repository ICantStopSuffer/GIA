import { useEffect, useState } from "react";

function App() {
  const [str, setStr] = useState("")

  useEffect(() => {
      fetch("http://localhost:8000/test2")
          .then((res) => res.text())
          .then((data) => setStr(data)).then(console.log(str));
  }, []);

  return (
    <>
      <div>
        {str}
      </div>
    </>
  );
}

export default App;
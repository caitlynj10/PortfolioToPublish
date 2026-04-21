export default function Sudoku() {
  

    return (
       
        <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center'}}>
            <div className = "game-wrapper" style={{
                width: "459px",
                height: "586.5px",
                margin: "10px",
                overflow: "hidden",

            }}>
            
            
                <iframe
                    src="/games/sudoku/index.html"
                    title="Sudoku Game"
                    width="540"
                    height="690"
                    style={{ transform: `scale(0.85)`, transformOrigin: 'top left', border: 'none' }}
                    scrolling="no"
                ></iframe>
            </div>
        </div>
          
    )
}
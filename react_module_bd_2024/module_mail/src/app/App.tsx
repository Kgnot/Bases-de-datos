import './App.css'
import {Login} from "../login/Login.tsx";
import {Principal} from "../principal/Principal.tsx";
import {usePerfil} from "../hooks/usePerfil.ts";

function App() {
    const {perfil} = usePerfil();

    console.log(perfil.usuario)
    return (
        <>
            {perfil.usuario === undefined &&
                <Login/>
            }
            {perfil.usuario !== undefined &&
                <Principal/>
            }
        </>
    )
}

export default App

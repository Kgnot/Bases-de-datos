import {StrictMode} from 'react'
import {createRoot} from 'react-dom/client'
import './index.css'
import App from './app/App.tsx'
import {PerfilProvider} from "./context/perfilContext.tsx";

createRoot(document.getElementById('root')!).render(
    <StrictMode>
        <PerfilProvider>
            {/*Hago un provider aqui xd*/}
            <App/>
        </PerfilProvider>
    </StrictMode>,
)

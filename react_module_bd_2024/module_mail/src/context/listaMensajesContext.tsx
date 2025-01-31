import {Mensaje} from "../model/mensaje.ts";
import {createContext, ReactNode, useEffect, useState} from "react";


export interface ListaMensajesContext {
    listaMensajes: Mensaje[];
    setListaMensajes: (mensajes: Mensaje[]) => void;
    selectCarpeta:(nom:string)=>void;
    selectCategoria:(nom:string)=>void;
    obtenerMensajes:()=>void;
}

export const ListaMensajesContext = createContext<ListaMensajesContext| undefined>( undefined);

type ContextProviderProps = {
    children:ReactNode
}

export const ListaMensajesProvider = ({children}:ContextProviderProps) =>
{
    const [listaMensajes,setListaMensajes] = useState<Mensaje[]>([] as Mensaje[]);
    const [urlMensajes,setUrlMensajes] = useState<URL>(new URL("http://localhost:8083/mensaje_usuario"));
    const url: URL = new URL("http://localhost:8083/mensaje_usuario");
    const urlParams:URLSearchParams = new URLSearchParams(url.search);

    const selectCarpeta = (nombreCarpeta:string):void =>
    {
        urlParams.append("carpeta",nombreCarpeta);
        setUrlMensajes(url);
    }
    const selectCategoria = (nombreCategoria:string):void =>
    {
        urlParams.append("categoria",nombreCategoria);
        setUrlMensajes(url);
    }

    const obtenerMensajes = async () =>
    {
        const response = await fetch(urlMensajes);
        const data:Mensaje[] = await response.json();
        setListaMensajes(data);
    }

    useEffect(() => {
        obtenerMensajes().then(r => console.log("obtenido- "+r));
    }, [listaMensajes, obtenerMensajes]);

    return(
        <ListaMensajesContext.Provider value={{listaMensajes,setListaMensajes,selectCarpeta,selectCategoria,obtenerMensajes}}>
            {children}
        </ListaMensajesContext.Provider>
    )
}
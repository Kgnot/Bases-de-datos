import './SeccionMitad.css'
import {MensajeItem} from "./Mensaje/MensajeItem.tsx";
import {Mensaje} from "../../model/mensaje.ts";
import {useFetch} from "../../hooks/useFetch.ts";


export const SeccionMitad = () => {
    const {data, loading, error} = useFetch<Mensaje[]>('http://localhost:8083/mensaje_usuario');

    if (loading) {
        return (
            <div className="seccionMitad">
                <h1> Cargando... </h1>
            </div>
        )
    }

    if (error || !data) {
        return (
            <div className="seccionMitad">
                <h1> error: {error?.message} </h1>
            </div>)
    }
    console.log(data)
    return (
        <>
            <div className="seccionMitad">
                {
                    data.map((mensaje: Mensaje, index: number) => (
                        <MensajeItem key={index} mensaje={mensaje}/>
                    ))
                }
            </div>

        </>
    )
}
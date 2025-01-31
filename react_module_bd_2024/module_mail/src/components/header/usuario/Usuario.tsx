import './Usuario.css'
import {usePerfil} from "../../../hooks/usePerfil.ts";

export const Usuario = () =>
{
    const {perfil} = usePerfil();
    const nombre = perfil.nombre + " - " + perfil.correoContacto;
    const fecha:Date = new Date(Date.now());


    return(
        <>
            <div className="usuario_header">
                <img src="./Gato2.png" alt=""/>
                <InfoUser nombre={nombre} fecha={fecha}/>
            </div>
        </>
    )
}

interface InfoUserProps
{
    nombre:string;
    fecha:Date;
}

const InfoUser = ({nombre,fecha}:InfoUserProps) =>
{
    return (
        <div className="usuario_header_infoUser">
            <p>{nombre}</p>
            <p>{fecha.toDateString()}</p>
        </div>
    )
}
import './Item.css'

interface ItemProps
{
    id:string;
    nombre:string;
}

export const Item = ({id,nombre}:ItemProps) =>
{
    return(
        <>
            <div className="item">
                <span>{id}</span>
                <hr className="hr_vertical"/>
                <span>{nombre}</span>
            </div>
        </>
    )
}
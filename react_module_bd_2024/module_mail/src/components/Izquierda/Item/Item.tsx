import './Item.css'

interface ItemProps
{
    id:string;
    nombre:string;
    onClick:(nom:string)=>void;
    isSelected?:boolean
}

export const Item = ({id,nombre,onClick, isSelected}:ItemProps) =>
{

    return(
        <>
            <div className={`item ${isSelected?"selected":""}` } onClick={()=>onClick(id)}>
                <span>{id} {isSelected?.valueOf()}</span>
                <hr className="hr_vertical"/>
                <span>{nombre}</span>
            </div>
        </>
    )
}
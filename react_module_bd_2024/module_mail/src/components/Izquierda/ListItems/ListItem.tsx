import './ListItem.css';
import {Item as ItemInterface} from "../../../model/item.ts";
import {Item} from "../Item/Item.tsx";
import {useState} from "react";

interface PropListItem
{
    titulo:string;
    items:ItemInterface[];
    methodParent:(nom:string)=>void;
}

export const ListItem = ({titulo,items,methodParent}:PropListItem) =>
{
    const [selectedName, setSelectedName] = useState<string | null>(null);

    const handleClick = (nombre: string) => {
        setSelectedName(nombre);
        methodParent(nombre);
    };

    return (
        <>
            <h3> {titulo}: </h3>
            {
             items?.map((item:ItemInterface,index:number) =>
             {
                 return(
                     <Item
                         key={index}
                         id={item.getId()}
                         nombre={item.getNombre()}
                         onClick={handleClick}
                         isSelected={selectedName === item.getId()}
                     />
                 )
             })
            }
            <hr/>
        </>
    )
}
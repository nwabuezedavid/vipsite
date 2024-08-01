"use client"
import { useEffect, useState } from 'react';
import PostX from './card';
import { NavTopic } from './nav';
import { exploreD } from './api';
import { useParams } from 'next/navigation';
const Main = () => {
  const {searchParams} = new URL(location?.href)
  const search =  searchParams.get('find')
   
const [setd, setsetd] = useState(search?search:'')
console.log(search)
const [datax, setdata] = useState([])
useEffect(() => {
  exploreD(setd)
  .then(e=>{
    console.log(e )
    setdata(e)
  })
  console.log(setd )
}, [setd])

  
  return (
    <div className='w-full h-full '>
      <NavTopic data={setsetd}/>
      <main className='flex w-full flex-wrap'>
        {datax?.map(e=><PostX key={e.id} value={e}/>)}


      </main>
    </div>
  )
}

export default Main

// { Array.from({ length: 5 }, () => (
//     <Star fill="#111" strokeWidth={0} />
// ))}
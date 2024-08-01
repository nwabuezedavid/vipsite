/** @type {import('next').NextConfig} */
 
module.exports = {
 
  eslint:{
    ignoreDuringBuilds:true
},
    experimental: {
      serverActions: {
        bodySizeLimit: '900mb',
      },
    },
  }
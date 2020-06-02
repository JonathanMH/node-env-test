FROM node:12.13-alpine

COPY . .
RUN npm install

# set app port
ENV PORT=5000

# start the app
CMD [ "npm", "start" ]

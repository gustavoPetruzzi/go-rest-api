package routes

import "github.com/gin-gonic/gin"

func registerForEvent(context *gin.Context) {
  userId := context.GetString("userId")
  eventId := context.Param("id")
}

func cancelRegistration(context *gin.Context) {
}
